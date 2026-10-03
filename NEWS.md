# washinvestments 0.0.2

* Text in `project_name` and `city` is valid UTF-8 again. The raw CSV mixes Windows-1252 and UTF-8 text; `data-raw/data_processing.R` now converts the 29 values that were not valid UTF-8 (26 in `project_name`, 3 in `city`) from Windows-1252, so accented names such as "SÃO PAULO", "Lomé" and "Ceará", typographic dashes and apostrophes come out correctly (#5).
* The CSV and the XLSX export are written from the same object. The XLSX file is now `inst/extdata/washinvestments.xlsx`; the old `washinvestments_utf8.xlsx`, in which the invalid characters were removed, is gone (#5).
* The exact duplicate row for project 53284-001 is removed, so the data have 1,872 records instead of 1,873 (#5).
* The region "Nothern Europe" is corrected to "Northern Europe" (#5).
