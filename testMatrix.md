## Lab 5 - Flutter BMI Calculator

### Test Matrix
| ID | Objective | Steps                                               | Expected Result                                      | Actual Result                                        | Pass |
|----|-----------|-----------------------------------------------------|------------------------------------------------------|------------------------------------------------------|------|
| 1  | Check a Healthy Weight BMI | Enter 5 feet 7 inches and 143 lbs                | 22.40                                                | 22.40                                                | ✔️    |
| 2  | Check an underweight BMI | Enter 5 feet 7 inches and 100 lbs           | 15.66                                                | 15.66                                               | ✔️    |
| 3  | Check an heavy weight range BMI | Enter 5 feet 3 inches and 140 lbs           | 24.80                                                | 24.80                                                | ✔️    |
| 4  | Check an overweight BMI | Enter 6 feet 1 inch and 190 lbs               | 25.07                                                | 25.07                                                | ✔️    |
| 5  | Check a severely overweight BMI | Enter 5 feet 8 inches and 999 lbs    | 151.90                                             | 151.90                                               | ✔️    |
| 6  | Check an empty feet | Enter empty feet 1 inches and 150 lbs                    | Error: Invalid height input. Enter feet. | Error: Invalid height input. Enter feet. | ✔️     |
| 7  | Check an empty  inches | Enter 1 feet empty inches and 150 lbs                    | Error: Invalid height input. Enter inches. | Error: Invalid height input. Enter inches. | ✔️     |
| 8  | Check a zero weight | Enter 5 feet 6 inches and empty lbs                      | Error: Invalid weight input. Enter weight. | Error: Invalid weight input. Enter weight. | ✔️     |
