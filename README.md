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
Updated: 2026-02-26T06:51:19.050878+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.981 |  |
| ap-east-1 | 0.713 |  |
| ap-east-2 | 0.646 |  |
| ap-northeast-1 | 0.529 |  |
| ap-northeast-2 | 0.653 |  |
| ap-northeast-3 | 0.552 |  |
| ap-south-1 | 0.892 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.783 |  |
| ap-southeast-2 | 0.704 |  |
| ap-southeast-3 | 0.850 |  |
| ap-southeast-4 | 0.734 |  |
| ap-southeast-5 | 0.804 |  |
| ap-southeast-6 | 0.740 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.216 | 16 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.491 |  |
| eu-central-2 | 0.530 |  |
| eu-north-1 | 0.545 |  |
| eu-south-1 | 0.522 |  |
| eu-south-2 | 0.525 |  |
| eu-west-1 | 0.424 |  |
| eu-west-2 | 0.452 |  |
| eu-west-3 | 0.468 |  |
| il-central-1 | 0.684 |  |
| me-central-1 | 0.863 |  |
| me-south-1 | 0.831 |  |
| mx-central-1 | 0.252 |  |
| sa-east-1 | 0.588 |  |
| us-east-1 | 0.147 | 4185 |
| us-east-2 | 0.157 | 1380 |
| us-gov-east-1 | 0.158 | 1510 |
| us-gov-west-1 | 0.222 | 162 |
| us-west-1 | 0.170 | 3121 |
| us-west-2 | 0.228 | 132 |

