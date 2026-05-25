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
Updated: 2026-05-25T20:58:18.039331+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.004 |  |
| ap-east-1 | 0.686 |  |
| ap-east-2 | 0.623 |  |
| ap-northeast-1 | 0.508 |  |
| ap-northeast-2 | 0.611 |  |
| ap-northeast-3 | 0.534 |  |
| ap-south-1 | 0.916 |  |
| ap-south-2 | 0.921 |  |
| ap-southeast-1 | 0.764 |  |
| ap-southeast-2 | 0.672 |  |
| ap-southeast-3 | 0.816 |  |
| ap-southeast-4 | 0.710 |  |
| ap-southeast-5 | 0.784 |  |
| ap-southeast-6 | 0.696 |  |
| ap-southeast-7 | 0.870 |  |
| ca-central-1 | 0.208 | 16 |
| ca-west-1 | 0.235 |  |
| eu-central-1 | 0.514 |  |
| eu-central-2 | 0.540 |  |
| eu-north-1 | 0.550 |  |
| eu-south-1 | 0.534 |  |
| eu-south-2 | 0.551 |  |
| eu-west-1 | 0.426 |  |
| eu-west-2 | 0.478 |  |
| eu-west-3 | 0.497 |  |
| il-central-1 | 0.677 |  |
| me-central-1 | 0.913 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.200 |  |
| sa-east-1 | 0.636 |  |
| us-east-1 | 0.175 | 4688 |
| us-east-2 | 0.133 | 1611 |
| us-gov-east-1 | 0.141 | 1706 |
| us-gov-west-1 | 0.182 | 195 |
| us-west-1 | 0.129 | 3601 |
| us-west-2 | 0.189 | 160 |

