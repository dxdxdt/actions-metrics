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
Updated: 2026-07-24T05:14:42.881123+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.049 |  |
| ap-east-1 | 0.629 |  |
| ap-east-2 | 0.570 |  |
| ap-northeast-1 | 0.451 |  |
| ap-northeast-2 | 0.557 |  |
| ap-northeast-3 | 0.475 |  |
| ap-south-1 | 0.880 |  |
| ap-south-2 | 0.847 |  |
| ap-southeast-1 | 0.704 |  |
| ap-southeast-2 | 0.642 |  |
| ap-southeast-3 | 0.760 |  |
| ap-southeast-4 | 0.688 |  |
| ap-southeast-5 | 0.725 |  |
| ap-southeast-6 | 0.664 |  |
| ap-southeast-7 | 0.806 |  |
| ca-central-1 | 0.279 | 16 |
| ca-west-1 | 0.171 |  |
| eu-central-1 | 0.566 |  |
| eu-central-2 | 0.590 |  |
| eu-north-1 | 0.607 |  |
| eu-south-1 | 0.595 |  |
| eu-south-2 | 0.601 |  |
| eu-west-1 | 0.485 |  |
| eu-west-2 | 0.522 |  |
| eu-west-3 | 0.553 |  |
| il-central-1 | 0.723 |  |
| me-central-1 | 0.954 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.275 |  |
| sa-east-1 | 0.684 |  |
| us-east-1 | 0.235 | 4903 |
| us-east-2 | 0.211 | 1660 |
| us-gov-east-1 | 0.218 | 1777 |
| us-gov-west-1 | 0.122 | 206 |
| us-west-1 | 0.131 | 3825 |
| us-west-2 | 0.120 | 170 |

