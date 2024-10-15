# Income Mobility Analysis for Bloomsburg University

This project analyzes income mobility data for Bloomsburg University of Pennsylvania, visualizing the share of students and their parents across different income quintiles.

## Table of Contents 

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Data](#data)
- [Visualization](#visualization)
- [Conclusion](#conclusion)
- [Contributing](#contributing)
- [License](#license)

## Features

- Load and filter mobility data for Bloomsburg University.
- Create transition matrices for student and parental income quintiles.
- Calculate student distributions across income quintiles.
- Visualize the data using bar plots.

## Installation

To run this analysis, ensure you have R and the necessary packages installed. You can install the required packages using the R package manager.

## Usage

Modify the path to point to your `mobility_data.csv` file and run the analysis script to generate data frames, matrices, and visualizations. The output will display the share of students and parents in each income quintile.

## Data

The data used in this analysis is contained in `mobility_data.csv`. Ensure this file is formatted correctly with appropriate columns for income quintiles and relevant data points.

## Visualization

The script generates a bar plot showing the share of students and parents across income quintiles using `ggplot2`. The visual representation facilitates a clear comparison between different generations.

## Conclusion

This analysis reveals that the majority of students' parents are located in the lower income quintiles. Furthermore, students are more likely to end up in the same or lower income quintiles as their parents, highlighting the persistence of socioeconomic status across generations. These findings can inform discussions on educational equity and the factors influencing student success.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

Thanks to the authors of the `dplyr` and `ggplot2` packages for their excellent work.
