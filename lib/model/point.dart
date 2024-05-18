class Point {
  int row;
  int column;

  Point(this.row, this.column);

  @override
  String toString() {
    return 'Point{row: $row, column: $column}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Point &&
          runtimeType == other.runtimeType &&
          row == other.row &&
          column == other.column;

  @override
  int get hashCode => row.hashCode ^ column.hashCode;
}
