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
Updated: 2026-01-19T11:16:31.844508+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.941 |  |
| ap-east-1 | 0.774 |  |
| ap-northeast-1 | 0.571 |  |
| ap-northeast-2 | 0.685 |  |
| ap-south-1 | 0.887 |  |
| ap-southeast-1 | 0.830 |  |
| ap-southeast-2 | 0.737 |  |
| ca-central-1 | 0.110 | 16 |
| eu-central-1 | 0.452 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.475 |  |
| eu-west-1 | 0.374 |  |
| eu-west-2 | 0.405 |  |
| eu-west-3 | 0.432 |  |
| me-south-1 | 0.786 |  |
| sa-east-1 | 0.542 |  |
| us-east-1 | 0.094 | 3964 |
| us-east-2 | 0.073 | 1264 |
| us-gov-east-1 | 0.074 | 1376 |
| us-gov-west-1 | 0.223 | 121 |
| us-west-1 | 0.231 | 2880 |
| us-west-2 | 0.232 | 108 |

