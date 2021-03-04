create database if not exists proxy;
use proxy;
create table if not exists proxy.proxy (
    id bigint unsigned auto_increment primary key,
    ip_v4 VARBINARY(4),
    ip_v6 VARBINARY(16),
    port int unsigned,
    updated_at datetime,
    real_ip varchar(32),
    latency int default null,
    status bool default 0,
    type varchar(12),
    country_code varchar(2),
    city_name varchar(40),

    index `idx_proxy__ip4_port` (ip_v4, port),
    index `idx_proxy__ip6_port` (ip_v6, port),
    index `idx_proxy__country` (country_code),
    index `idx_proxy__type` (type)
);
