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
Updated: 2026-04-17T15:53:22.935887+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.934 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.597 |  |
| ap-northeast-2 | 0.704 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.904 |  |
| ap-south-2 | 0.987 |  |
| ap-southeast-1 | 0.848 |  |
| ap-southeast-2 | 0.762 |  |
| ap-southeast-3 | 0.903 |  |
| ap-southeast-4 | 0.811 |  |
| ap-southeast-5 | 0.861 |  |
| ap-southeast-6 | 0.800 |  |
| ap-southeast-7 | 0.952 |  |
| ca-central-1 | 0.120 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.441 |  |
| eu-central-2 | 0.461 |  |
| eu-north-1 | 0.493 |  |
| eu-south-1 | 0.459 |  |
| eu-south-2 | 0.475 |  |
| eu-west-1 | 0.367 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.416 |  |
| il-central-1 | 0.616 |  |
| me-central-1 | 0.830 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.212 |  |
| sa-east-1 | 0.542 |  |
| us-east-1 | 0.086 | 4517 |
| us-east-2 | 0.086 | 1508 |
| us-gov-east-1 | 0.093 | 1652 |
| us-gov-west-1 | 0.275 | 193 |
| us-west-1 | 0.224 | 3425 |
| us-west-2 | 0.275 | 156 |

