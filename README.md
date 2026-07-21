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
Updated: 2026-07-21T21:58:02.142737+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.727 |  |
| ap-east-2 | 0.669 |  |
| ap-northeast-1 | 0.550 |  |
| ap-northeast-2 | 0.650 |  |
| ap-northeast-3 | 0.576 |  |
| ap-south-1 | 0.928 |  |
| ap-south-2 | 0.976 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.726 |  |
| ap-southeast-3 | 0.852 |  |
| ap-southeast-4 | 0.768 |  |
| ap-southeast-5 | 0.821 |  |
| ap-southeast-6 | 0.760 |  |
| ap-southeast-7 | 0.905 |  |
| ca-central-1 | 0.183 | 16 |
| ca-west-1 | 0.266 |  |
| eu-central-1 | 0.477 |  |
| eu-central-2 | 0.494 |  |
| eu-north-1 | 0.518 |  |
| eu-south-1 | 0.494 |  |
| eu-south-2 | 0.504 |  |
| eu-west-1 | 0.378 |  |
| eu-west-2 | 0.418 |  |
| eu-west-3 | 0.447 |  |
| il-central-1 | 0.629 |  |
| me-central-1 | 0.874 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.205 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.139 | 4895 |
| us-east-2 | 0.145 | 1659 |
| us-gov-east-1 | 0.150 | 1772 |
| us-gov-west-1 | 0.231 | 206 |
| us-west-1 | 0.189 | 3815 |
| us-west-2 | 0.234 | 167 |

