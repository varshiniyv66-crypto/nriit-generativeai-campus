"use client";

import React from 'react';
import {
    RadarChart, Radar, PolarGrid, PolarAngleAxis, PolarRadiusAxis,
    AreaChart, Area, BarChart, Bar, XAxis, YAxis, CartesianGrid,
    Tooltip, ResponsiveContainer, Legend, ComposedChart, Line,
    Cell
} from 'recharts';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card';

// Color palette
const COLORS = ['#3b82f6', '#8b5cf6', '#10b981', '#f59e0b', '#ef4444', '#06b6d4', '#ec4899'];
const GRADIENT_COLORS = {
    blue: { start: '#3b82f6', end: '#1d4ed8' },
    purple: { start: '#8b5cf6', end: '#6d28d9' },
    green: { start: '#10b981', end: '#059669' },
    amber: { start: '#f59e0b', end: '#d97706' },
    red: { start: '#ef4444', end: '#dc2626' },
    cyan: { start: '#06b6d4', end: '#0891b2' },
};

interface ChartProps {
    data: any[];
    title?: string;
    description?: string;
    height?: number;
    className?: string;
}

// Animated Radar Chart
export function AnimatedRadarChart({
    data,
    title,
    description,
    height = 300,
    dataKey = 'value',
    nameKey = 'subject',
    className
}: ChartProps & { dataKey?: string; nameKey?: string }) {
    return (
        <Card className={`hover:shadow-lg transition-all duration-300 ${className}`}>
            {title && (
                <CardHeader>
                    <CardTitle className="flex items-center gap-2 text-lg">{title}</CardTitle>
                    {description && <CardDescription>{description}</CardDescription>}
                </CardHeader>
            )}
            <CardContent>
                <ResponsiveContainer width="100%" height={height}>
                    <RadarChart data={data}>
                        <defs>
                            <linearGradient id="radarGradient" x1="0" y1="0" x2="0" y2="1">
                                <stop offset="5%" stopColor="#8b5cf6" stopOpacity={0.8} />
                                <stop offset="95%" stopColor="#3b82f6" stopOpacity={0.2} />
                            </linearGradient>
                        </defs>
                        <PolarGrid stroke="#e5e7eb" />
                        <PolarAngleAxis
                            dataKey={nameKey}
                            tick={{ fill: '#6b7280', fontSize: 12 }}
                        />
                        <PolarRadiusAxis
                            angle={30}
                            domain={[0, 100]}
                            tick={{ fill: '#9ca3af', fontSize: 10 }}
                        />
                        <Radar
                            name="Score"
                            dataKey={dataKey}
                            stroke="#8b5cf6"
                            fill="url(#radarGradient)"
                            strokeWidth={2}
                            animationBegin={0}
                            animationDuration={1500}
                            animationEasing="ease-out"
                        />
                        <Tooltip
                            contentStyle={{
                                backgroundColor: 'white',
                                border: '1px solid #e5e7eb',
                                borderRadius: '8px',
                                boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)'
                            }}
                        />
                    </RadarChart>
                </ResponsiveContainer>
            </CardContent>
        </Card>
    );
}

// Animated Area Chart
export function AnimatedAreaChart({
    data,
    title,
    description,
    height = 250,
    dataKeys = [{ key: 'value', color: 'blue', name: 'Value' }],
    xAxisKey = 'name',
    className
}: ChartProps & {
    dataKeys?: { key: string; color: string; name: string }[];
    xAxisKey?: string;
}) {
    return (
        <Card className={`hover:shadow-lg transition-all duration-300 ${className}`}>
            {title && (
                <CardHeader>
                    <CardTitle className="flex items-center gap-2 text-lg">{title}</CardTitle>
                    {description && <CardDescription>{description}</CardDescription>}
                </CardHeader>
            )}
            <CardContent>
                <ResponsiveContainer width="100%" height={height}>
                    <AreaChart data={data}>
                        <defs>
                            {dataKeys.map((dk, i) => (
                                <linearGradient key={dk.key} id={`areaGradient${i}`} x1="0" y1="0" x2="0" y2="1">
                                    <stop offset="5%" stopColor={GRADIENT_COLORS[dk.color as keyof typeof GRADIENT_COLORS]?.start || COLORS[i]} stopOpacity={0.8} />
                                    <stop offset="95%" stopColor={GRADIENT_COLORS[dk.color as keyof typeof GRADIENT_COLORS]?.end || COLORS[i]} stopOpacity={0.1} />
                                </linearGradient>
                            ))}
                        </defs>
                        <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" />
                        <XAxis
                            dataKey={xAxisKey}
                            stroke="#888"
                            fontSize={12}
                            tickLine={false}
                        />
                        <YAxis
                            stroke="#888"
                            fontSize={12}
                            tickLine={false}
                            axisLine={false}
                        />
                        <Tooltip
                            contentStyle={{
                                backgroundColor: 'white',
                                border: '1px solid #e5e7eb',
                                borderRadius: '8px',
                                boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)'
                            }}
                        />
                        <Legend />
                        {dataKeys.map((dk, i) => (
                            <Area
                                key={dk.key}
                                type="monotone"
                                dataKey={dk.key}
                                name={dk.name}
                                stroke={GRADIENT_COLORS[dk.color as keyof typeof GRADIENT_COLORS]?.start || COLORS[i]}
                                fill={`url(#areaGradient${i})`}
                                strokeWidth={2}
                                animationBegin={i * 200}
                                animationDuration={1500}
                                animationEasing="ease-out"
                            />
                        ))}
                    </AreaChart>
                </ResponsiveContainer>
            </CardContent>
        </Card>
    );
}

// Animated Segmented Bar Chart
export function AnimatedSegmentedBarChart({
    data,
    title,
    description,
    height = 300,
    segments = [
        { key: 'passed', color: '#10b981', name: 'Passed' },
        { key: 'failed', color: '#ef4444', name: 'Failed' },
    ],
    xAxisKey = 'name',
    className
}: ChartProps & {
    segments?: { key: string; color: string; name: string }[];
    xAxisKey?: string;
}) {
    return (
        <Card className={`hover:shadow-lg transition-all duration-300 ${className}`}>
            {title && (
                <CardHeader>
                    <CardTitle className="flex items-center gap-2 text-lg">{title}</CardTitle>
                    {description && <CardDescription>{description}</CardDescription>}
                </CardHeader>
            )}
            <CardContent>
                <ResponsiveContainer width="100%" height={height}>
                    <BarChart data={data} barCategoryGap="20%">
                        <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" vertical={false} />
                        <XAxis
                            dataKey={xAxisKey}
                            stroke="#888"
                            fontSize={12}
                            tickLine={false}
                        />
                        <YAxis
                            stroke="#888"
                            fontSize={12}
                            tickLine={false}
                            axisLine={false}
                        />
                        <Tooltip
                            contentStyle={{
                                backgroundColor: 'white',
                                border: '1px solid #e5e7eb',
                                borderRadius: '8px',
                                boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)'
                            }}
                            cursor={{ fill: 'rgba(0, 0, 0, 0.05)' }}
                        />
                        <Legend />
                        {segments.map((seg, i) => (
                            <Bar
                                key={seg.key}
                                dataKey={seg.key}
                                name={seg.name}
                                stackId="a"
                                fill={seg.color}
                                radius={i === segments.length - 1 ? [8, 8, 0, 0] : [0, 0, 0, 0]}
                                animationBegin={i * 100}
                                animationDuration={1200}
                                animationEasing="ease-out"
                            />
                        ))}
                    </BarChart>
                </ResponsiveContainer>
            </CardContent>
        </Card>
    );
}

// Animated Bar Chart with gradient
export function AnimatedBarChart({
    data,
    title,
    description,
    height = 250,
    dataKey = 'value',
    xAxisKey = 'name',
    color = 'blue',
    className
}: ChartProps & {
    dataKey?: string;
    xAxisKey?: string;
    color?: 'blue' | 'purple' | 'green' | 'amber' | 'red' | 'cyan';
}) {
    const gradientColor = GRADIENT_COLORS[color];

    return (
        <Card className={`hover:shadow-lg transition-all duration-300 ${className}`}>
            {title && (
                <CardHeader>
                    <CardTitle className="flex items-center gap-2 text-lg">{title}</CardTitle>
                    {description && <CardDescription>{description}</CardDescription>}
                </CardHeader>
            )}
            <CardContent>
                <ResponsiveContainer width="100%" height={height}>
                    <BarChart data={data}>
                        <defs>
                            <linearGradient id={`barGradient${color}`} x1="0" y1="0" x2="0" y2="1">
                                <stop offset="5%" stopColor={gradientColor.start} stopOpacity={1} />
                                <stop offset="95%" stopColor={gradientColor.end} stopOpacity={0.8} />
                            </linearGradient>
                        </defs>
                        <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" vertical={false} />
                        <XAxis
                            dataKey={xAxisKey}
                            stroke="#888"
                            fontSize={12}
                            tickLine={false}
                        />
                        <YAxis
                            stroke="#888"
                            fontSize={12}
                            tickLine={false}
                            axisLine={false}
                        />
                        <Tooltip
                            contentStyle={{
                                backgroundColor: 'white',
                                border: '1px solid #e5e7eb',
                                borderRadius: '8px',
                                boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)'
                            }}
                            cursor={{ fill: 'rgba(0, 0, 0, 0.05)' }}
                        />
                        <Bar
                            dataKey={dataKey}
                            fill={`url(#barGradient${color})`}
                            radius={[8, 8, 0, 0]}
                            animationBegin={0}
                            animationDuration={1200}
                            animationEasing="ease-out"
                        >
                            {data.map((entry, index) => (
                                <Cell
                                    key={`cell-${index}`}
                                    opacity={0.6 + (index / data.length) * 0.4}
                                />
                            ))}
                        </Bar>
                    </BarChart>
                </ResponsiveContainer>
            </CardContent>
        </Card>
    );
}

// Composed Chart (Bar + Line)
export function ComposedLineBarChart({
    data,
    title,
    description,
    height = 300,
    barKey = 'value',
    lineKey = 'trend',
    xAxisKey = 'name',
    className
}: ChartProps & {
    barKey?: string;
    lineKey?: string;
    xAxisKey?: string;
}) {
    return (
        <Card className={`hover:shadow-lg transition-all duration-300 ${className}`}>
            {title && (
                <CardHeader>
                    <CardTitle className="flex items-center gap-2 text-lg">{title}</CardTitle>
                    {description && <CardDescription>{description}</CardDescription>}
                </CardHeader>
            )}
            <CardContent>
                <ResponsiveContainer width="100%" height={height}>
                    <ComposedChart data={data}>
                        <defs>
                            <linearGradient id="composedBarGradient" x1="0" y1="0" x2="0" y2="1">
                                <stop offset="5%" stopColor="#3b82f6" stopOpacity={0.9} />
                                <stop offset="95%" stopColor="#1d4ed8" stopOpacity={0.7} />
                            </linearGradient>
                        </defs>
                        <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" vertical={false} />
                        <XAxis
                            dataKey={xAxisKey}
                            stroke="#888"
                            fontSize={12}
                            tickLine={false}
                        />
                        <YAxis
                            stroke="#888"
                            fontSize={12}
                            tickLine={false}
                            axisLine={false}
                        />
                        <Tooltip
                            contentStyle={{
                                backgroundColor: 'white',
                                border: '1px solid #e5e7eb',
                                borderRadius: '8px',
                                boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)'
                            }}
                        />
                        <Legend />
                        <Bar
                            dataKey={barKey}
                            name="Value"
                            fill="url(#composedBarGradient)"
                            radius={[8, 8, 0, 0]}
                            animationBegin={0}
                            animationDuration={1200}
                            animationEasing="ease-out"
                        />
                        <Line
                            type="monotone"
                            dataKey={lineKey}
                            name="Trend"
                            stroke="#f59e0b"
                            strokeWidth={3}
                            dot={{ fill: '#f59e0b', r: 5 }}
                            animationBegin={500}
                            animationDuration={1500}
                            animationEasing="ease-out"
                        />
                    </ComposedChart>
                </ResponsiveContainer>
            </CardContent>
        </Card>
    );
}

// Multi-series Radar Chart
export function MultiSeriesRadarChart({
    data,
    title,
    description,
    height = 350,
    series = [
        { key: 'current', name: 'Current Semester', color: '#8b5cf6' },
        { key: 'previous', name: 'Previous Semester', color: '#10b981' },
    ],
    angleKey = 'subject',
    className
}: ChartProps & {
    series?: { key: string; name: string; color: string }[];
    angleKey?: string;
}) {
    return (
        <Card className={`hover:shadow-lg transition-all duration-300 ${className}`}>
            {title && (
                <CardHeader>
                    <CardTitle className="flex items-center gap-2 text-lg">{title}</CardTitle>
                    {description && <CardDescription>{description}</CardDescription>}
                </CardHeader>
            )}
            <CardContent>
                <ResponsiveContainer width="100%" height={height}>
                    <RadarChart data={data}>
                        <PolarGrid stroke="#e5e7eb" />
                        <PolarAngleAxis
                            dataKey={angleKey}
                            tick={{ fill: '#6b7280', fontSize: 11 }}
                        />
                        <PolarRadiusAxis
                            angle={30}
                            domain={[0, 100]}
                            tick={{ fill: '#9ca3af', fontSize: 10 }}
                        />
                        {series.map((s, i) => (
                            <Radar
                                key={s.key}
                                name={s.name}
                                dataKey={s.key}
                                stroke={s.color}
                                fill={s.color}
                                fillOpacity={0.2}
                                strokeWidth={2}
                                animationBegin={i * 300}
                                animationDuration={1500}
                                animationEasing="ease-out"
                            />
                        ))}
                        <Legend />
                        <Tooltip
                            contentStyle={{
                                backgroundColor: 'white',
                                border: '1px solid #e5e7eb',
                                borderRadius: '8px',
                                boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)'
                            }}
                        />
                    </RadarChart>
                </ResponsiveContainer>
            </CardContent>
        </Card>
    );
}

export { COLORS, GRADIENT_COLORS };
