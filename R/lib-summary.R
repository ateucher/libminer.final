#' R Library Summary
#'
#' Provides a brief summary of the package libraries on your machine
#'
#' @param ... Grouping variables for the summary. Zero or more of the column
#'  names from [lib()].
#' @param sizes Should the sizes of the libraries be calculated?
#'   Logical; default `FALSE`.
#'
#' @return A data.frame containing the count of packages in each of the user's
#'   libraries. A `size` column is included if `sizes = TRUE`.
#' @export
#'
#' @examples
#' lib_summary()
#' lib_summary(sizes = TRUE)
lib_summary <- function(..., sizes = FALSE) {
  if (!is.logical(sizes)) {
    cli::cli_abort("You supplied {.val {sizes}} to {.var sizes}. It should be a {.cls logical} value, not {.obj_type_friendly {sizes}}.")
  }

  lib() |>
    calculate_sizes(do_calc = sizes) |>
    dplyr::group_by(...) |>
    dplyr::summarise(
      n = dplyr::n(),
      dplyr::across(dplyr::any_of("size"), sum),
      .groups = "drop"
    )
}

#' calculate sizes
#'
#' @param df a data.frame
#' @param do_calc should the sizes be calculated? If `FALSE`, `df` is
#'  returned unaltered.
#'
#' @return df with a lib_size column
#' @noRd
calculate_sizes <- function(df, do_calc) {
  if (!isTRUE(do_calc)) return(df)

  cli::cli_inform(c("i" = "Calculating sizes..."))

  df |>
    dplyr::mutate(
      size = purrr::map_dbl(
        fs::path(.data$LibPath, .data$Package),
        \(x) sum(fs::file_size(fs::dir_ls(x, recurse = TRUE)))
      )
    )
}

#' Generate a tible of installed packages
#'
#' @return a tibble of all packages installed on a system
#' @export
lib <- function() {
  utils::installed.packages() |>
    dplyr::as_tibble()
}
