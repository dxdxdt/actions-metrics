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
Updated: 2026-02-11T04:24:45.110371+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.021 |  |
| ap-east-1 | 0.684 |  |
| ap-northeast-1 | 0.502 |  |
| ap-northeast-2 | 0.610 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.651 |  |
| ap-southeast-3 | 0.982 |  |
| ap-southeast-4 | 0.689 |  |
| ca-central-1 | 0.214 | 16 |
| ca-west-1 | 0.181 |  |
| eu-central-1 | 0.527 |  |
| eu-central-2 | 0.544 |  |
| eu-north-1 | 0.581 |  |
| eu-south-1 | 0.563 |  |
| eu-south-2 | 0.588 |  |
| eu-west-1 | 0.457 |  |
| eu-west-2 | 0.484 |  |
| eu-west-3 | 0.522 |  |
| il-central-1 | 0.720 |  |
| me-central-1 | 0.903 |  |
| me-south-1 | 0.887 |  |
| sa-east-1 | 0.633 |  |
| us-east-1 | 0.185 | 4098 |
| us-east-2 | 0.161 | 1331 |
| us-gov-east-1 | 0.161 | 1451 |
| us-gov-west-1 | 0.155 | 143 |
| us-west-1 | 0.136 | 3038 |
| us-west-2 | 0.158 | 125 |

