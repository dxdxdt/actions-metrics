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
Updated: 2026-03-12T08:34:38.740520+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.894 |  |
| ap-east-1 | 0.801 |  |
| ap-east-2 | 0.736 |  |
| ap-northeast-1 | 0.627 |  |
| ap-northeast-2 | 0.732 |  |
| ap-northeast-3 | 0.649 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.896 |  |
| ap-southeast-1 | 0.877 |  |
| ap-southeast-2 | 0.787 |  |
| ap-southeast-3 | 0.925 |  |
| ap-southeast-4 | 0.827 |  |
| ap-southeast-5 | 0.901 |  |
| ap-southeast-6 | 0.841 |  |
| ap-southeast-7 | 0.974 |  |
| ca-central-1 | 0.119 | 16 |
| ca-west-1 | 0.274 |  |
| eu-central-1 | 0.398 |  |
| eu-central-2 | 0.413 |  |
| eu-north-1 | 0.450 |  |
| eu-south-1 | 0.424 |  |
| eu-south-2 | 0.430 |  |
| eu-west-1 | 0.319 |  |
| eu-west-2 | 0.358 |  |
| eu-west-3 | 0.383 |  |
| il-central-1 | 0.565 |  |
| me-central-1 | 0.766 |  |
| me-south-1 | 0.740 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.499 |  |
| us-east-1 | 0.068 | 4263 |
| us-east-2 | 0.100 | 1419 |
| us-gov-east-1 | 0.099 | 1565 |
| us-gov-west-1 | 0.308 | 180 |
| us-west-1 | 0.262 | 3214 |
| us-west-2 | 0.312 | 144 |

