# Load packages
library(DT)
library(ggplot2)
library(shiny)
library(shinyalert)
library(shinyBS)
library(shinythemes)
library(shinyWidgets)
library(tidyverse)

# Bookmark
enableBookmarking(store = "url")

# Modifictaion of inputs to have the labels on the left
sliderInputSplit <- function (label, l = 5,...) {
  fluidRow(
    column(l, div(class = 'sl', label)),
    column((12 - l), sliderInput(label = NULL,...))
  )
}


numericInputSplit <- function (inputId, label, value, ...) {
  fluidRow(
    column(5, div(class = 'sl', label)),
    column(7, numericInput(inputId = inputId, label = NULL, value = value,...))
  )
}
