test_that("fetchLDM works", {
  
  skip_if_offline()
  
  skip_on_cran()
  
  res <- fetchLDM("Typic Argialbolls",
                  what = "corr_taxsubgrp",
                  tables = c("lab_physical_properties",
                             "lab_chemical_properties"))
  
  expect_true(inherits(res, 'SoilProfileCollection'))
  
  res2 <- fetchLDM("Typic Argialbolls",
                   what = "corr_taxsubgrp",
                   tables = c("lab_physical_properties",
                              "lab_chemical_properties",
                              "lab_xray_and_thermal"))
  expect_null(res2)
  
  res3 <- fetchLDM("Typic Argialbolls",
                   what = "corr_taxsubgrp",
                  tables = c("lab_physical_properties",
                             "lab_chemical_properties",
                             "lab_xray_and_thermal"), 
                  analyzed_size_frac = "0.02-0.05 mm")
  expect_true(inherits(res3, 'SoilProfileCollection'))
})
