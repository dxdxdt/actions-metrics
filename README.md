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
Updated: 2026-04-11T20:24:19.781449+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.879 |  |
| ap-east-1 | 0.807 |  |
| ap-east-2 | 0.741 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.728 |  |
| ap-northeast-3 | 0.655 |  |
| ap-south-1 | 0.847 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.875 |  |
| ap-southeast-2 | 0.795 |  |
| ap-southeast-3 | 0.938 |  |
| ap-southeast-4 | 0.835 |  |
| ap-southeast-5 | 0.891 |  |
| ap-southeast-6 | 0.856 |  |
| ap-southeast-7 | 0.975 |  |
| ca-central-1 | 0.096 | 16 |
| ca-west-1 | 0.288 |  |
| eu-central-1 | 0.389 |  |
| eu-central-2 | 0.405 |  |
| eu-north-1 | 0.449 |  |
| eu-south-1 | 0.412 |  |
| eu-south-2 | 0.428 |  |
| eu-west-1 | 0.302 |  |
| eu-west-2 | 0.346 |  |
| eu-west-3 | 0.372 |  |
| il-central-1 | 0.555 |  |
| me-central-1 | 0.768 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.489 |  |
| us-east-1 | 0.052 | 4482 |
| us-east-2 | 0.072 | 1495 |
| us-gov-east-1 | 0.083 | 1641 |
| us-gov-west-1 | 0.316 | 192 |
| us-west-1 | 0.255 | 3396 |
| us-west-2 | 0.319 | 155 |

