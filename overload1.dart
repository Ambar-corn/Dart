class Matrix {
  List<List<int>> data;

  Matrix(this.data);

  Matrix operator +(Matrix other) {
    // code
    final rows = data.length;
    final columns = data[0].length;
    final isValid =
        rows == other.data.length && columns == other.data[0].length;
    if (!isValid) {
      return this;
    }
    var result = List<List<int>>.generate(
        rows, (i) => List<int>.generate(columns, (index) => 0));

    for (var i = 0; i < rows; i++) {
      for (var j = 0; j < columns; j++) {
        result[i][j] = data[i][j] + other.data[i][j];
      }
    }

    return Matrix(result);
  }

  Matrix operator *(Matrix other) {
    // code
    if (data[0].length != other.data.length) {
      print("Error");
      return this;
    }

    final rows = data.length;
    final columns = data[0].length;
    final otherColumns = other.data[0].length;
    var result = List<List<int>>.generate(
        rows, (i) => List<int>.generate(otherColumns, (index) => 0));

    for (var i = 0; i < rows; i++) {
      for (var j = 0; j < otherColumns; j++) {
        for (var k = 0; k < columns; ++k) {
          result[i][j] += data[i][k] * other.data[k][j];
        }
      }
    }

    return Matrix(result);
  }

  Matrix transpose() {
    // code
    final rows = data.length;
    final columns = data[0].length;
    var result = List<List<int>>.generate(
        columns, (i) => List<int>.generate(rows, (index) => 0));
    for (var i = 0; i < rows; i++) {
      for (var j = 0; j < columns; j++) {
        result[j][i] = data[i][j];
      }
    }
    return Matrix(result);
  }
}
