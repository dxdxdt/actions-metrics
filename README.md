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
Updated: 2026-06-06T20:57:08.420378+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.027 |  |
| ap-east-1 | 0.659 |  |
| ap-east-2 | 0.595 |  |
| ap-northeast-1 | 0.482 |  |
| ap-northeast-2 | 0.587 |  |
| ap-northeast-3 | 0.508 |  |
| ap-south-1 | 0.925 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.743 |  |
| ap-southeast-2 | 0.633 |  |
| ap-southeast-3 | 0.797 |  |
| ap-southeast-4 | 0.673 |  |
| ap-southeast-5 | 0.757 |  |
| ap-southeast-6 | 0.665 |  |
| ap-southeast-7 | 0.841 |  |
| ca-central-1 | 0.264 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.542 |  |
| eu-central-2 | 0.566 |  |
| eu-north-1 | 0.585 |  |
| eu-south-1 | 0.581 |  |
| eu-south-2 | 0.575 |  |
| eu-west-1 | 0.459 |  |
| eu-west-2 | 0.499 |  |
| eu-west-3 | 0.530 |  |
| il-central-1 | 0.696 |  |
| me-central-1 | 0.924 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.659 |  |
| us-east-1 | 0.209 | 4729 |
| us-east-2 | 0.171 | 1626 |
| us-gov-east-1 | 0.178 | 1709 |
| us-gov-west-1 | 0.152 | 197 |
| us-west-1 | 0.097 | 3639 |
| us-west-2 | 0.153 | 162 |

