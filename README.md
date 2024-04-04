# Immunizations Flu Shots 2022

## Objectives
### Come up with flu shots dashboard for 2022 that does the following:
<ol>
  <li>Total % of patients getting flu shots stratified by <ul>
    <li>Age</li>
    <li>Race</li>
    <li>County (on map)</li>
    <li>Overall</li>
  </ul></li>
  <li>Running total of flu shots over the course of 2022</li>
  <li>Total number of flu shots given in 2022</li>
  <li>A list of Patients that show whether or not they received the flu shots</li>
</ol>

Skills applied: JOIN, Window Functions, Common Table Expressions (CTE), Date Functions, and CASE Statement

## SQL Query
<img src = "Snap.png"></img>

### Filtering Active Patients:
- Define the criteria for active patients: patients who have had encounters at a hospital between 2020 and 2022, are alive, and are at least 6 years old (eligible for the flu shot).
Apply the criteria to filter the active patients from the dataset.

### Ranking Flu Shot Dates:
- Use the DENSE_RANK() function to rank the flu shot dates for each patient in 2022, ensuring that the latest date is ranked first.

### Identifying Latest Flu Shot Date:
- Extract the latest flu shot date for each patient in 2022 based on the ranking.

## Visualizations
<img src = "Immunization Dashboard.png"></img>
### Dashboard Components
These visualizations are created in Tableau and can be found here: <a href = "https://public.tableau.com/app/profile/alejandro.de.la.cruz5286/viz/ImmunizationsFluShots2022_16969790052040/Dashboard1" target = "_blank">Immunizations Flu Shots 2022 Dashboard</a>

## Results

