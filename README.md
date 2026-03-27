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
Updated: 2026-03-27T20:30:20.931335+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.028 |  |
| ap-east-1 | 0.668 |  |
| ap-east-2 | 0.604 |  |
| ap-northeast-1 | 0.486 |  |
| ap-northeast-2 | 0.599 |  |
| ap-northeast-3 | 0.517 |  |
| ap-south-1 | 0.890 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.743 |  |
| ap-southeast-2 | 0.630 |  |
| ap-southeast-3 | 0.799 |  |
| ap-southeast-4 | 0.668 |  |
| ap-southeast-5 | 0.765 |  |
| ap-southeast-6 | 0.671 |  |
| ap-southeast-7 | 0.854 |  |
| ca-central-1 | 0.264 | 16 |
| ca-west-1 | 0.202 |  |
| eu-central-1 | 0.545 |  |
| eu-central-2 | 0.562 |  |
| eu-north-1 | 0.612 |  |
| eu-south-1 | 0.582 |  |
| eu-south-2 | 0.609 |  |
| eu-west-1 | 0.471 |  |
| eu-west-2 | 0.510 |  |
| eu-west-3 | 0.527 |  |
| il-central-1 | 0.732 |  |
| me-central-1 | 0.910 |  |
| me-south-1 | 0.865 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.672 |  |
| us-east-1 | 0.210 | 4372 |
| us-east-2 | 0.203 | 1458 |
| us-gov-east-1 | 0.202 | 1609 |
| us-gov-west-1 | 0.161 | 190 |
| us-west-1 | 0.103 | 3311 |
| us-west-2 | 0.163 | 151 |

