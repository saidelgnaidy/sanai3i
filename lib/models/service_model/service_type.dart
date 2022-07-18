abstract class ServiceType {
  static const ServiceType job = _JobType();
  static const ServiceType shop = _ShopType();
  static const ServiceType transport = _TransportType();
  const ServiceType();

  factory ServiceType.fromStr(String str) {
    if (str == ServiceType.job.toString()) {
      return ServiceType.job;
    }
    if (str == ServiceType.shop.toString()) {
      return ServiceType.shop;
    }
    if (str == ServiceType.transport.toString()) {
      return ServiceType.transport;
    }
    return ServiceType.job;
  }
}

class _JobType extends ServiceType  {
  const _JobType();
  @override
  String toString() {
    return 'Job';
  }
}

class _ShopType extends ServiceType {
  const _ShopType();
  @override
  String toString() {
    return 'Shop';
  }
}

class _TransportType extends ServiceType {
  const _TransportType();
  @override
  String toString() {
    return 'Transport';
  }
}
