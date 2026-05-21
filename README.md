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
Updated: 2026-05-21T23:55:11.084526+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.033 |  |
| ap-east-1 | 0.671 |  |
| ap-east-2 | 0.611 |  |
| ap-northeast-1 | 0.496 |  |
| ap-northeast-2 | 0.600 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.940 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.746 |  |
| ap-southeast-2 | 0.639 |  |
| ap-southeast-3 | 0.801 |  |
| ap-southeast-4 | 0.679 |  |
| ap-southeast-5 | 0.764 |  |
| ap-southeast-6 | 0.675 |  |
| ap-southeast-7 | 0.853 |  |
| ca-central-1 | 0.239 | 16 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.553 |  |
| eu-central-2 | 0.568 |  |
| eu-north-1 | 0.596 |  |
| eu-south-1 | 0.584 |  |
| eu-south-2 | 0.581 |  |
| eu-west-1 | 0.477 |  |
| eu-west-2 | 0.515 |  |
| eu-west-3 | 0.528 |  |
| il-central-1 | 0.722 |  |
| me-central-1 | 0.987 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.653 |  |
| us-east-1 | 0.206 | 4672 |
| us-east-2 | 0.163 | 1604 |
| us-gov-east-1 | 0.171 | 1700 |
| us-gov-west-1 | 0.157 | 195 |
| us-west-1 | 0.106 | 3587 |
| us-west-2 | 0.159 | 158 |

