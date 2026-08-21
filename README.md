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
Updated: 2026-08-21T15:25:18.408064+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.063 |  |
| ap-east-1 | 0.641 |  |
| ap-east-2 | 0.573 |  |
| ap-northeast-1 | 0.455 |  |
| ap-northeast-2 | 0.564 |  |
| ap-northeast-3 | 0.482 |  |
| ap-south-1 | 0.930 |  |
| ap-south-2 | 0.890 |  |
| ap-southeast-1 | 0.725 |  |
| ap-southeast-2 | 0.605 |  |
| ap-southeast-3 | 0.770 |  |
| ap-southeast-4 | 0.651 |  |
| ap-southeast-5 | 0.742 |  |
| ap-southeast-6 | 0.651 |  |
| ap-southeast-7 | 0.818 |  |
| ca-central-1 | 0.310 | 18 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.575 |  |
| eu-central-2 | 0.599 |  |
| eu-north-1 | 0.615 |  |
| eu-south-1 | 0.609 |  |
| eu-south-2 | 0.615 |  |
| eu-west-1 | 0.497 |  |
| eu-west-2 | 0.536 |  |
| eu-west-3 | 0.567 |  |
| il-central-1 | 0.731 |  |
| me-central-1 | 0.966 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.212 |  |
| sa-east-1 | 0.673 |  |
| us-east-1 | 0.235 | 5036 |
| us-east-2 | 0.266 | 1680 |
| us-gov-east-1 | 0.249 | 1865 |
| us-gov-west-1 | 0.146 | 225 |
| us-west-1 | 0.084 | 4014 |
| us-west-2 | 0.145 | 184 |

