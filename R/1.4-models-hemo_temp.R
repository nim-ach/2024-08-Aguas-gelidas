# Prepare workspace -------------------------------------------------------

## Load libraries
library(data.table)

## Load data
data("ice")

## Influencia del control autonómico (basal, pre, post) sobre el control hemodinámico ----

### Presión basal ----

ice[, lm(t_basal_derecho ~ bp_systolic)] |> summary() # ns
ice[, lm(t_basal_izquierdo ~ bp_systolic)] |> summary() # ns
ice[, lm(t_pre_derecho ~ bp_systolic)] |> summary() # ns
ice[, lm(t_pre_izquierdo ~ bp_systolic)] |> summary() # ns
ice[, lm(t_post_derecho ~ bp_systolic)] |> summary() # ns
ice[, lm(t_post_izquierdo ~ bp_systolic)] |> summary() # ns
ice[, lm(t_post_derecho_2 ~ bp_systolic)] |> summary() # ns
ice[, lm(t_post_izquierdo_2 ~ bp_systolic)] |> summary() # ns

ice[, lm(t_basal_derecho ~ bp_diastolic)] |> summary() # ns
ice[, lm(t_basal_izquierdo ~ bp_diastolic)] |> summary() # ns
ice[, lm(t_pre_derecho ~ bp_diastolic)] |> summary() # ns
ice[, lm(t_pre_izquierdo ~ bp_diastolic)] |> summary() # .
ice[, lm(t_post_derecho ~ bp_diastolic)] |> summary() # ns
ice[, lm(t_post_izquierdo ~ bp_diastolic)] |> summary() # .
ice[, lm(t_post_derecho_2 ~ bp_diastolic)] |> summary() # ns
ice[, lm(t_post_izquierdo_2 ~ bp_diastolic)] |> summary() # ns

### Presión pre ----

ice[, lm(t_basal_derecho ~ bp_systolic_2)] |> summary() # ns
ice[, lm(t_basal_izquierdo ~ bp_systolic_2)] |> summary() # ns
ice[, lm(t_pre_derecho ~ bp_systolic_2)] |> summary() # .
ice[, lm(t_pre_izquierdo ~ bp_systolic_2)] |> summary() # ns
ice[, lm(t_post_derecho ~ bp_systolic_2)] |> summary() # .
ice[, lm(t_post_izquierdo ~ bp_systolic_2)] |> summary() # ns
ice[, lm(t_post_derecho_2 ~ bp_systolic_2)] |> summary() # ns
ice[, lm(t_post_izquierdo_2 ~ bp_systolic_2)] |> summary() # ns

ice[, lm(t_basal_derecho ~ bp_diastolic_2)] |> summary() # ns
ice[, lm(t_basal_izquierdo ~ bp_diastolic_2)] |> summary() # ns
ice[, lm(t_pre_derecho ~ bp_diastolic_2)] |> summary() # ns
ice[, lm(t_pre_izquierdo ~ bp_diastolic_2)] |> summary() # ns
ice[, lm(t_post_derecho ~ bp_diastolic_2)] |> summary() # ns
ice[, lm(t_post_izquierdo ~ bp_diastolic_2)] |> summary() # ns
ice[, lm(t_post_derecho_2 ~ bp_diastolic_2)] |> summary() # ns
ice[, lm(t_post_izquierdo_2 ~ bp_diastolic_2)] |> summary() # ns

### Presión post-0 ----

ice[, lm(t_basal_derecho ~ bp_systolic_3)] |> summary() # ns
ice[, lm(t_basal_izquierdo ~ bp_systolic_3)] |> summary() # ns
ice[, lm(t_pre_derecho ~ bp_systolic_3)] |> summary() # ns
ice[, lm(t_pre_izquierdo ~ bp_systolic_3)] |> summary() # ns
ice[, lm(t_post_derecho ~ bp_systolic_3)] |> summary() # ns
ice[, lm(t_post_izquierdo ~ bp_systolic_3)] |> summary() # ns
ice[, lm(t_post_derecho_2 ~ bp_systolic_3)] |> summary() # ns
ice[, lm(t_post_izquierdo_2 ~ bp_systolic_3)] |> summary() # ns

ice[, lm(t_basal_derecho ~ bp_diastolic_3)] |> summary() # ns
ice[, lm(t_basal_izquierdo ~ bp_diastolic_3)] |> summary() # *
ice[, lm(t_pre_derecho ~ bp_diastolic_3)] |> summary() # ns
ice[, lm(t_pre_izquierdo ~ bp_diastolic_3)] |> summary() # ns
ice[, lm(t_post_derecho ~ bp_diastolic_3)] |> summary() # ns
ice[, lm(t_post_izquierdo ~ bp_diastolic_3)] |> summary() # ns
ice[, lm(t_post_derecho_2 ~ bp_diastolic_3)] |> summary() # ns
ice[, lm(t_post_izquierdo_2 ~ bp_diastolic_3)] |> summary() # ns

### Presión delta pre-post00 ----

ice[, lm(t_basal_derecho ~ bp_systolic_delta_00)] |> summary() # ns
ice[, lm(t_basal_izquierdo ~ bp_systolic_delta_00)] |> summary() # ns
ice[, lm(t_pre_derecho ~ bp_systolic_delta_00)] |> summary() # ns
ice[, lm(t_pre_izquierdo ~ bp_systolic_delta_00)] |> summary() # ns
ice[, lm(t_post_derecho ~ bp_systolic_delta_00)] |> summary() # ns
ice[, lm(t_post_izquierdo ~ bp_systolic_delta_00)] |> summary() # ns
ice[, lm(t_post_derecho_2 ~ bp_systolic_delta_00)] |> summary() # .
ice[, lm(t_post_izquierdo_2 ~ bp_systolic_delta_00)] |> summary() # .

ice[, lm(t_basal_derecho ~ bp_diastolic_delta_00)] |> summary() # ns
ice[, lm(t_basal_izquierdo ~ bp_diastolic_delta_00)] |> summary() # ns
ice[, lm(t_pre_derecho ~ bp_diastolic_delta_00)] |> summary() # ns
ice[, lm(t_pre_izquierdo ~ bp_diastolic_delta_00)] |> summary() # ns
ice[, lm(t_post_derecho ~ bp_diastolic_delta_00)] |> summary() # ns
ice[, lm(t_post_izquierdo ~ bp_diastolic_delta_00)] |> summary() # ns
ice[, lm(t_post_derecho_2 ~ bp_diastolic_delta_00)] |> summary() # ns
ice[, lm(t_post_izquierdo_2 ~ bp_diastolic_delta_00)] |> summary() # ns

### Presión delta pre-post10 ----

ice[, lm(t_basal_derecho ~ bp_systolic_delta_10)] |> summary() # ns
ice[, lm(t_basal_izquierdo ~ bp_systolic_delta_10)] |> summary() # ns
ice[, lm(t_pre_derecho ~ bp_systolic_delta_10)] |> summary() # ns
ice[, lm(t_pre_izquierdo ~ bp_systolic_delta_10)] |> summary() # ns
ice[, lm(t_post_derecho ~ bp_systolic_delta_10)] |> summary() # ns
ice[, lm(t_post_izquierdo ~ bp_systolic_delta_10)] |> summary() # ns
ice[, lm(t_post_derecho_2 ~ bp_systolic_delta_10)] |> summary() # ns
ice[, lm(t_post_izquierdo_2 ~ bp_systolic_delta_10)] |> summary() # ns

ice[, lm(t_basal_derecho ~ bp_diastolic_delta_10)] |> summary() # ns
ice[, lm(t_basal_izquierdo ~ bp_diastolic_delta_10)] |> summary() # ns
ice[, lm(t_pre_derecho ~ bp_diastolic_delta_10)] |> summary() # ns
ice[, lm(t_pre_izquierdo ~ bp_diastolic_delta_10)] |> summary() # ns
ice[, lm(t_post_derecho ~ bp_diastolic_delta_10)] |> summary() # ns
ice[, lm(t_post_izquierdo ~ bp_diastolic_delta_10)] |> summary() # ns
ice[, lm(t_post_derecho_2 ~ bp_diastolic_delta_10)] |> summary() # ns
ice[, lm(t_post_izquierdo_2 ~ bp_diastolic_delta_10)] |> summary() # ns

### Presión post-10 ----

ice[, lm(t_basal_derecho ~ bp_systolic_4)] |> summary() # ns
ice[, lm(t_basal_izquierdo ~ bp_systolic_4)] |> summary() # ns
ice[, lm(t_pre_derecho ~ bp_systolic_4)] |> summary() # ns
ice[, lm(t_pre_izquierdo ~ bp_systolic_4)] |> summary() # ns
ice[, lm(t_post_derecho ~ bp_systolic_4)] |> summary() # ns
ice[, lm(t_post_izquierdo ~ bp_systolic_4)] |> summary() # ns
ice[, lm(t_post_derecho_2 ~ bp_systolic_4)] |> summary() # ns
ice[, lm(t_post_izquierdo_2 ~ bp_systolic_4)] |> summary() # ns

ice[, lm(t_basal_derecho ~ bp_diastolic_4)] |> summary() # ns
ice[, lm(t_basal_izquierdo ~ bp_diastolic_4)] |> summary() # ns
ice[, lm(t_pre_derecho ~ bp_diastolic_4)] |> summary() # ns
ice[, lm(t_pre_izquierdo ~ bp_diastolic_4)] |> summary() # ns
ice[, lm(t_post_derecho ~ bp_diastolic_4)] |> summary() # ns
ice[, lm(t_post_izquierdo ~ bp_diastolic_4)] |> summary() # ns
ice[, lm(t_post_derecho_2 ~ bp_diastolic_4)] |> summary() # ns
ice[, lm(t_post_izquierdo_2 ~ bp_diastolic_4)] |> summary() # ns

## Delta de temperatura con presión

ice[, lm(t_delta00_derecho ~ bp_systolic)] |> summary() # ns
ice[, lm(t_delta00_derecho ~ bp_systolic_2)] |> summary() # **
ice[, lm(t_delta00_derecho ~ bp_systolic_3)] |> summary() # ns
ice[, lm(t_delta00_derecho ~ bp_systolic_4)] |> summary() # ns
ice[, lm(t_delta00_derecho ~ bp_systolic_delta_00)] |> summary() # ns
ice[, lm(t_delta00_derecho ~ bp_systolic_delta_10)] |> summary() # ns

ice[, lm(t_delta00_derecho ~ bp_diastolic)] |> summary() # ns
ice[, lm(t_delta00_derecho ~ bp_diastolic_2)] |> summary() # .
ice[, lm(t_delta00_derecho ~ bp_diastolic_3)] |> summary() # ns
ice[, lm(t_delta00_derecho ~ bp_diastolic_4)] |> summary() # ns
ice[, lm(t_delta00_derecho ~ bp_diastolic_delta_00)] |> summary() # ns
ice[, lm(t_delta00_derecho ~ bp_diastolic_delta_10)] |> summary() # ns

ice[, lm(t_delta00_izquierdo ~ bp_systolic)] |> summary() # ns
ice[, lm(t_delta00_izquierdo ~ bp_systolic_2)] |> summary() # ns
ice[, lm(t_delta00_izquierdo ~ bp_systolic_3)] |> summary() # ns
ice[, lm(t_delta00_izquierdo ~ bp_systolic_4)] |> summary() # ns
ice[, lm(t_delta00_izquierdo ~ bp_systolic_delta_00)] |> summary() # ns
ice[, lm(t_delta00_izquierdo ~ bp_systolic_delta_10)] |> summary() # ns

ice[, lm(t_delta00_izquierdo ~ bp_diastolic)] |> summary() # ns
ice[, lm(t_delta00_izquierdo ~ bp_diastolic_2)] |> summary() # ns
ice[, lm(t_delta00_izquierdo ~ bp_diastolic_3)] |> summary() # ns
ice[, lm(t_delta00_izquierdo ~ bp_diastolic_4)] |> summary() # ns
ice[, lm(t_delta00_izquierdo ~ bp_diastolic_delta_00)] |> summary() # ns
ice[, lm(t_delta00_izquierdo ~ bp_diastolic_delta_10)] |> summary() # ns

ice[, lm(t_delta10_derecho ~ bp_systolic)] |> summary() # ns
ice[, lm(t_delta10_derecho ~ bp_systolic_2)] |> summary() # ns
ice[, lm(t_delta10_derecho ~ bp_systolic_3)] |> summary() # ns
ice[, lm(t_delta10_derecho ~ bp_systolic_4)] |> summary() # ns
ice[, lm(t_delta10_derecho ~ bp_systolic_delta_00)] |> summary() # ns
ice[, lm(t_delta10_derecho ~ bp_systolic_delta_10)] |> summary() # ns

ice[, lm(t_delta10_derecho ~ bp_diastolic)] |> summary() #ns
ice[, lm(t_delta10_derecho ~ bp_diastolic_2)] |> summary() #ns
ice[, lm(t_delta10_derecho ~ bp_diastolic_3)] |> summary() #ns
ice[, lm(t_delta10_derecho ~ bp_diastolic_4)] |> summary() #ns
ice[, lm(t_delta10_derecho ~ bp_diastolic_delta_00)] |> summary() #ns
ice[, lm(t_delta10_derecho ~ bp_diastolic_delta_10)] |> summary() #ns

ice[, lm(t_delta10_izquierdo ~ bp_systolic)] |> summary() # ns
ice[, lm(t_delta10_izquierdo ~ bp_systolic_2)] |> summary() # ns
ice[, lm(t_delta10_izquierdo ~ bp_systolic_3)] |> summary() # ns
ice[, lm(t_delta10_izquierdo ~ bp_systolic_4)] |> summary() # ns
ice[, lm(t_delta10_izquierdo ~ bp_systolic_delta_00)] |> summary() # *
ice[, lm(t_delta10_izquierdo ~ bp_systolic_delta_10)] |> summary() # ns

ice[, lm(t_delta10_izquierdo ~ bp_diastolic)] |> summary() # ns
ice[, lm(t_delta10_izquierdo ~ bp_diastolic_2)] |> summary() # ns
ice[, lm(t_delta10_izquierdo ~ bp_diastolic_3)] |> summary() # ns
ice[, lm(t_delta10_izquierdo ~ bp_diastolic_4)] |> summary() # ns
ice[, lm(t_delta10_izquierdo ~ bp_diastolic_delta_00)] |> summary() # ns
ice[, lm(t_delta10_izquierdo ~ bp_diastolic_delta_10)] |> summary() # ns
