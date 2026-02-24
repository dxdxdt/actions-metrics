# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-02-24T08:37:51.366398+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.907 |  |
| ap-east-1 | 0.781 |  |
| ap-east-2 | 0.703 |  |
| ap-northeast-1 | 0.588 |  |
| ap-northeast-2 | 0.702 |  |
| ap-northeast-3 | 0.613 |  |
| ap-south-1 | 0.874 |  |
| ap-south-2 | 0.916 |  |
| ap-southeast-1 | 0.849 |  |
| ap-southeast-2 | 0.778 |  |
| ap-southeast-3 | 0.905 |  |
| ap-southeast-4 | 0.816 |  |
| ap-southeast-5 | 0.876 |  |
| ap-southeast-6 | 0.875 |  |
| ap-southeast-7 | 0.960 |  |
| ca-central-1 | 0.148 | 16 |
| ca-west-1 | 0.273 |  |
| eu-central-1 | 0.415 |  |
| eu-central-2 | 0.443 |  |
| eu-north-1 | 0.471 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.451 |  |
| eu-west-1 | 0.347 |  |
| eu-west-2 | 0.381 |  |
| eu-west-3 | 0.391 |  |
| il-central-1 | 0.595 |  |
| me-central-1 | 0.818 |  |
| me-south-1 | 0.780 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.521 |  |
| us-east-1 | 0.089 | 4175 |
| us-east-2 | 0.123 | 1374 |
| us-gov-east-1 | 0.119 | 1503 |
| us-gov-west-1 | 0.308 | 161 |
| us-west-1 | 0.251 | 3110 |
| us-west-2 | 0.286 | 130 |

