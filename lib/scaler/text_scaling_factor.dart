class TextScalingFactor {
  const TextScalingFactor({
    this.scaleFactor = 1.0,
  });

  final double scaleFactor;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final TextScalingFactor otherModel = other as TextScalingFactor;
    return otherModel.scaleFactor == scaleFactor;
  }

  @override
  int get hashCode => scaleFactor.hashCode;
}
