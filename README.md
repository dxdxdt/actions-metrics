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
Updated: 2026-02-17T14:02:46.993531+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.028 |  |
| ap-east-1 | 0.663 |  |
| ap-east-2 | 0.595 |  |
| ap-northeast-1 | 0.479 |  |
| ap-northeast-2 | 0.586 |  |
| ap-south-1 | 0.941 |  |
| ap-south-2 | 0.918 |  |
| ap-southeast-1 | 0.749 |  |
| ap-southeast-2 | 0.637 |  |
| ap-southeast-3 | 0.792 |  |
| ap-southeast-4 | 0.678 |  |
| ap-southeast-5 | 0.756 |  |
| ap-southeast-6 | 0.684 |  |
| ap-southeast-7 | 0.844 |  |
| ca-central-1 | 0.250 | 16 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.540 |  |
| eu-central-2 | 0.557 |  |
| eu-north-1 | 0.594 |  |
| eu-south-1 | 0.581 |  |
| eu-south-2 | 0.577 |  |
| eu-west-1 | 0.487 |  |
| eu-west-2 | 0.512 |  |
| eu-west-3 | 0.522 |  |
| il-central-1 | 0.716 |  |
| me-central-1 | 0.933 |  |
| me-south-1 | 0.891 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.654 |  |
| us-east-1 | 0.193 | 4134 |
| us-east-2 | 0.181 | 1351 |
| us-gov-east-1 | 0.180 | 1484 |
| us-gov-west-1 | 0.153 | 153 |
| us-west-1 | 0.124 | 3068 |
| us-west-2 | 0.155 | 126 |

