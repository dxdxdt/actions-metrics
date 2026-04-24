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
Updated: 2026-04-24T11:00:13.492349+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.984 |  |
| ap-east-1 | 0.726 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.566 |  |
| ap-northeast-2 | 0.653 |  |
| ap-northeast-3 | 0.565 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.933 |  |
| ap-southeast-1 | 0.786 |  |
| ap-southeast-2 | 0.698 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.733 |  |
| ap-southeast-5 | 0.817 |  |
| ap-southeast-6 | 0.733 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.216 | 16 |
| ca-west-1 | 0.219 |  |
| eu-central-1 | 0.508 |  |
| eu-central-2 | 0.522 |  |
| eu-north-1 | 0.554 |  |
| eu-south-1 | 0.530 |  |
| eu-south-2 | 0.535 |  |
| eu-west-1 | 0.418 |  |
| eu-west-2 | 0.456 |  |
| eu-west-3 | 0.474 |  |
| il-central-1 | 0.663 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.605 |  |
| us-east-1 | 0.162 | 4553 |
| us-east-2 | 0.154 | 1528 |
| us-gov-east-1 | 0.168 | 1662 |
| us-gov-west-1 | 0.210 | 194 |
| us-west-1 | 0.151 | 3468 |
| us-west-2 | 0.210 | 157 |

