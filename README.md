<h3 align="center">Date Text Masked</h3>

<div align="center">

  

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![GitHub Issues](https://img.shields.io/github/issues/LucazzP/date_text_masked.svg)](https://github.com/LucazzP/date_text_masked/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/LucazzP/date_text_masked.svg)](https://github.com/LucazzP/date_text_masked/pulls)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

  

</div>

  

---

  

<br>

</p>


## 📝 Table of Contents

  
-  [About](#about)

-  [Getting Started](#getting_started)

-  [Usage](#usage)

-  [Built Using](#built_using)

-  [Contributing](../CONTRIBUTING.md)

-  [Authors](#authors)


  
## 🧐 About <a name = "about"></a>

  

This package helps you to create a text field with date mask, this field can be added an icon that 
calls the  `showDatePicker` and gives to the user these two options to type the date.



## 🏁 Getting Started <a name = "getting_started"></a>

  
### Prerequisites

  

- A project in [Flutter](https://flutter.dev)


  

### Installing

  

Follow the [instructions](https://pub.dev/packages/date_text_masked#-installing-tab-).

  

## 🎈 Usage <a name="usage"></a>

  
You can view the complete example on [example project](https://github.com/LucazzP/date_text_masked/tree/master/example) 
and the following example on [Home Page example](https://github.com/LucazzP/date_text_masked/blob/master/example/lib/src/home/home_page.dart).

```

DateTextFormField(
    onValidate: (date) {            // Execute this function when the form is validated.
      print(date);
    },
    validator: ((date) {            // Executed to validate the date, true if is validated and false if no.
      return true;
    }),
    labelFail: "Invalid date",      // The error that will be show
    decoration: InputDecoration(),  // Decoration to the widget
    showDatePicker: true,
    dateFormat: 'yyyy-dd-mm',       // Date format to the mask, 'yyyy' is the year, 'dd' is the day and 'mm' is the month
    initialData: null,              // Initial date
    firstDate: DateTime(1900),      // First Date to the showPicker if is enabled
    lastDate: DateTime(2100),       // Last Date to the showPicker if is enabled
),

```

  

## ⛏️ Built Using <a name = "built_using"></a>

  

- [Flutter](https://flutter.dev/) - Framework
- [Dart](https://dart.dev/) - Language
- [bloc_pattern Package](https://pub.dev/packages/bloc_pattern) - Flutter package
  

## ✍️ Authors <a name = "authors"></a>

  

-  [@LucazzP](https://github.com/LucazzP) - Idea & Initial work

  
See also the list of [contributors](https://github.com/LucazzP/date_text_masked/contributors) who participated in this project.