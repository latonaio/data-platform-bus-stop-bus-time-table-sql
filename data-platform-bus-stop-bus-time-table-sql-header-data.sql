CREATE TABLE `data_platform_bus_stop_bus_time_table_header_data`
(
  `BusStop`                      int(16) NOT NULL,
  `BusLine`                      int(16) NOT NULL,
  `TimeTableVersion`             int(4) NOT NULL,
  `WeekdayType`                  varchar(6) NOT NULL,
  `BusStopBusTimeTableID`        int(4) NOT NULL,
  `ExpressType`                  varchar(4) NOT NULL,
  `DepartingTime`                time(16) NOT NULL,
  `ArrivingTime`                 time(16) DEFAULT NULL,
  `Description`                  varchar(60) NOT NULL,
  `OperationRemarks`             varchar(100) DEFAULT NULL,
  `ValidityStartDate`            date NOT NULL,
  `ValidityEndDate`              date NOT NULL,
  `CreationDate`                 date NOT NULL,
  `CreationTime`                 time NOT NULL,
  `LastChangeDate`               date NOT NULL,
  `LastChangeTime`               time NOT NULL,
  `CreateUser`                   int(12) NOT NULL,
  `LastChangeUser`               int(12) NOT NULL,
  `IsReleased`                   tinyint(1) DEFAULT NULL,
  `IsMarkedForDeletion`          tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`BusStop`, `BusLine`, `TimeTableVersion`, `WeekdayType`, `BusStopBusTimeTableID`, `ExpressType`),

    CONSTRAINT `DPFMBusStopBusTimeTableHeaderData_fk` FOREIGN KEY (`BusStop`, `BusLine`) REFERENCES `data_platform_bus_stop_bus_line_data` (`BusStop`, `BusLine`),
    CONSTRAINT `DPFMBusStopBusTimeTableHeaderDataWeekdayType_fk` FOREIGN KEY (`BusLine`, `WeekdayType`) REFERENCES `data_platform_bus_line_weekday_type_data` (`BusLine`, `WeekdayType`),
    CONSTRAINT `DPFMBusStopBusTimeTableHeaderDataExpressType_fk` FOREIGN KEY (`BusLine`, `ExpressType`) REFERENCES `data_platform_bus_line_express_type_data` (`BusLine`, `ExpressType`),
    CONSTRAINT `DPFMBusStopBusTimeTableHeaderDataCreateUser_fk` FOREIGN KEY (`CreateUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`),
    CONSTRAINT `DPFMBusStopBusTimeTableHeaderDataLastChangeUser_fk` FOREIGN KEY (`LastChangeUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
