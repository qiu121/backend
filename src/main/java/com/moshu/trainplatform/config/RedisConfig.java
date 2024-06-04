package com.moshu.trainplatform.config;

import java.io.Serializable;
import java.sql.SQLException;
import java.time.Duration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moshu.trainplatform.entity.*;
import org.springframework.cache.CacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializationContext;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

import javax.sql.DataSource;

@Configuration
public class RedisConfig {
	
	@Bean
	public RedisTemplate<String, Serializable> redisTemplate(LettuceConnectionFactory connectionFactory) {
		RedisTemplate<String, Serializable> redisTemplate = new RedisTemplate<>();
		redisTemplate.setKeySerializer(new StringRedisSerializer());
		redisTemplate.setValueSerializer(new GenericJackson2JsonRedisSerializer());
		redisTemplate.setConnectionFactory(connectionFactory);
		return redisTemplate;
	}

	/*
	@Bean
	public CacheManager cacheManager(RedisConnectionFactory factory) {
		RedisCacheConfiguration config = RedisCacheConfiguration.defaultCacheConfig();  // 生成一个默认配置，通过config对象即可对缓存进行自定义配置
		config = config.entryTtl(Duration.ofHours(12))     // 设置缓存的默认过期时间，也是使用Duration设置
				.disableCachingNullValues();     // 不缓存空值

		// 设置一个初始化的缓存空间set集合
		Set<String> cacheNames = new HashSet<>();
		cacheNames.add(CustomSectionItem.CACHE_HEADER);
		cacheNames.add(Experiment.CACHE_HEADER);
		cacheNames.add(QuestionGroup.CACHE_HEADER);
		cacheNames.add(Reference.CACHE_HEADER);
		cacheNames.add(Training.CACHE_HEADER);
		cacheNames.add(Video.CACHE_HEADER);

		// 对每个缓存空间应用不同的配置
		Map<String, RedisCacheConfiguration> configMap = new HashMap<>();
		configMap.put(CustomSectionItem.CACHE_HEADER, config.entryTtl(Duration.ofHours(2)));
		configMap.put(Experiment.CACHE_HEADER, config.entryTtl(Duration.ofHours(2)));
		configMap.put(QuestionGroup.CACHE_HEADER, config.entryTtl(Duration.ofHours(2)));
		configMap.put(Reference.CACHE_HEADER, config.entryTtl(Duration.ofHours(2)));
		configMap.put(Training.CACHE_HEADER, config.entryTtl(Duration.ofHours(2)));
		configMap.put(Video.CACHE_HEADER, config.entryTtl(Duration.ofHours(2)));

		RedisCacheManager cacheManager = RedisCacheManager.builder(factory)     // 使用自定义的缓存配置初始化一个cacheManager
				.initialCacheNames(cacheNames)  // 注意这两句的调用顺序，一定要先调用该方法设置初始化的缓存名，再初始化相关的配置
				.withInitialCacheConfigurations(configMap)
				.build();
		return cacheManager;
	}
	*/

}
