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
Updated: 2026-07-12T23:45:02.518927+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.933 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.688 |  |
| ap-northeast-1 | 0.567 |  |
| ap-northeast-2 | 0.673 |  |
| ap-northeast-3 | 0.593 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.930 |  |
| ap-southeast-1 | 0.819 |  |
| ap-southeast-2 | 0.735 |  |
| ap-southeast-3 | 0.874 |  |
| ap-southeast-4 | 0.784 |  |
| ap-southeast-5 | 0.840 |  |
| ap-southeast-6 | 0.771 |  |
| ap-southeast-7 | 0.922 |  |
| ca-central-1 | 0.165 | 16 |
| ca-west-1 | 0.276 |  |
| eu-central-1 | 0.450 |  |
| eu-central-2 | 0.472 |  |
| eu-north-1 | 0.500 |  |
| eu-south-1 | 0.484 |  |
| eu-south-2 | 0.488 |  |
| eu-west-1 | 0.368 |  |
| eu-west-2 | 0.407 |  |
| eu-west-3 | 0.436 |  |
| il-central-1 | 0.605 |  |
| me-central-1 | 0.829 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.118 | 4861 |
| us-east-2 | 0.126 | 1656 |
| us-gov-east-1 | 0.122 | 1741 |
| us-gov-west-1 | 0.245 | 202 |
| us-west-1 | 0.195 | 3773 |
| us-west-2 | 0.246 | 165 |

