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
Updated: 2026-03-26T11:44:02.548701+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.899 |  |
| ap-east-1 | 0.801 |  |
| ap-east-2 | 0.729 |  |
| ap-northeast-1 | 0.610 |  |
| ap-northeast-2 | 0.726 |  |
| ap-northeast-3 | 0.633 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.860 |  |
| ap-southeast-2 | 0.780 |  |
| ap-southeast-3 | 0.914 |  |
| ap-southeast-4 | 0.819 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.833 |  |
| ap-southeast-7 | 0.972 |  |
| ca-central-1 | 0.133 | 16 |
| ca-west-1 | 0.261 |  |
| eu-central-1 | 0.419 |  |
| eu-central-2 | 0.423 |  |
| eu-north-1 | 0.466 |  |
| eu-south-1 | 0.427 |  |
| eu-south-2 | 0.449 |  |
| eu-west-1 | 0.327 |  |
| eu-west-2 | 0.365 |  |
| eu-west-3 | 0.398 |  |
| il-central-1 | 0.566 |  |
| me-central-1 | 0.780 |  |
| me-south-1 | 0.750 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.511 |  |
| us-east-1 | 0.076 | 4362 |
| us-east-2 | 0.087 | 1456 |
| us-gov-east-1 | 0.100 | 1605 |
| us-gov-west-1 | 0.300 | 190 |
| us-west-1 | 0.236 | 3301 |
| us-west-2 | 0.300 | 151 |

