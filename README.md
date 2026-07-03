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
Updated: 2026-07-03T23:05:18.622273+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.865 |  |
| ap-east-1 | 0.825 |  |
| ap-east-2 | 0.768 |  |
| ap-northeast-1 | 0.652 |  |
| ap-northeast-2 | 0.754 |  |
| ap-northeast-3 | 0.675 |  |
| ap-south-1 | 0.825 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.900 |  |
| ap-southeast-2 | 0.780 |  |
| ap-southeast-3 | 0.958 |  |
| ap-southeast-4 | 0.827 |  |
| ap-southeast-5 | 0.924 |  |
| ap-southeast-6 | 0.817 |  |
| ap-southeast-7 | 1.000 |  |
| ca-central-1 | 0.117 | 16 |
| ca-west-1 | 0.286 |  |
| eu-central-1 | 0.383 |  |
| eu-central-2 | 0.410 |  |
| eu-north-1 | 0.444 |  |
| eu-south-1 | 0.417 |  |
| eu-south-2 | 0.420 |  |
| eu-west-1 | 0.308 |  |
| eu-west-2 | 0.344 |  |
| eu-west-3 | 0.364 |  |
| il-central-1 | 0.542 |  |
| me-central-1 | 0.794 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.493 |  |
| us-east-1 | 0.059 | 4816 |
| us-east-2 | 0.099 | 1652 |
| us-gov-east-1 | 0.099 | 1728 |
| us-gov-west-1 | 0.318 | 200 |
| us-west-1 | 0.253 | 3735 |
| us-west-2 | 0.319 | 164 |

