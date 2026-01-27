# module "components"{
#     source="../../terraform-roboshop-component"
#     component=var.component
#     rule_priority=var.rule_priority
# }

module "components"{
    for_each=var.components
    source="https://github.com/praveenapalla4-creator/terraform-roboshop-component.git?=main"
    
    component=each.key
    rule_priority=each.value.rule_priority
}