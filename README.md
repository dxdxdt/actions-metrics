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
Updated: 2026-02-20T23:22:14.279641+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.953 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.682 |  |
| ap-northeast-1 | 0.570 |  |
| ap-northeast-2 | 0.675 |  |
| ap-northeast-3 | 0.601 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.953 |  |
| ap-southeast-1 | 0.816 |  |
| ap-southeast-2 | 0.734 |  |
| ap-southeast-3 | 0.881 |  |
| ap-southeast-4 | 0.770 |  |
| ap-southeast-5 | 0.839 |  |
| ap-southeast-6 | 0.840 |  |
| ap-southeast-7 | 0.927 |  |
| ca-central-1 | 0.117 | 16 |
| ca-west-1 | 0.201 |  |
| eu-central-1 | 0.460 |  |
| eu-central-2 | 0.475 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.482 |  |
| eu-south-2 | 0.495 |  |
| eu-west-1 | 0.377 |  |
| eu-west-2 | 0.411 |  |
| eu-west-3 | 0.444 |  |
| il-central-1 | 0.628 |  |
| me-central-1 | 0.833 |  |
| me-south-1 | 0.796 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.557 |  |
| us-east-1 | 0.100 | 4155 |
| us-east-2 | 0.080 | 1359 |
| us-gov-east-1 | 0.079 | 1495 |
| us-gov-west-1 | 0.220 | 160 |
| us-west-1 | 0.234 | 3088 |
| us-west-2 | 0.220 | 129 |

