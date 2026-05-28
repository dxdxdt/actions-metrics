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
Updated: 2026-05-28T06:45:59.459843+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.925 |  |
| ap-east-1 | 0.824 |  |
| ap-east-2 | 0.730 |  |
| ap-northeast-1 | 0.603 |  |
| ap-northeast-2 | 0.711 |  |
| ap-northeast-3 | 0.632 |  |
| ap-south-1 | 0.855 |  |
| ap-south-2 | 0.906 |  |
| ap-southeast-1 | 0.864 |  |
| ap-southeast-2 | 0.763 |  |
| ap-southeast-3 | 0.907 |  |
| ap-southeast-4 | 0.792 |  |
| ap-southeast-5 | 0.871 |  |
| ap-southeast-6 | 0.783 |  |
| ap-southeast-7 | 0.955 |  |
| ca-central-1 | 0.142 | 16 |
| ca-west-1 | 0.337 |  |
| eu-central-1 | 0.434 |  |
| eu-central-2 | 0.450 |  |
| eu-north-1 | 0.473 |  |
| eu-south-1 | 0.457 |  |
| eu-south-2 | 0.473 |  |
| eu-west-1 | 0.356 |  |
| eu-west-2 | 0.395 |  |
| eu-west-3 | 0.417 |  |
| il-central-1 | 0.591 |  |
| me-central-1 | 0.872 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.217 |  |
| sa-east-1 | 0.541 |  |
| us-east-1 | 0.092 | 4693 |
| us-east-2 | 0.101 | 1613 |
| us-gov-east-1 | 0.104 | 1706 |
| us-gov-west-1 | 0.274 | 195 |
| us-west-1 | 0.224 | 3612 |
| us-west-2 | 0.276 | 161 |

