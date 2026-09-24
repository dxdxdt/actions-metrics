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
Updated: 2026-09-24T10:50:52.237724+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.944 |  |
| ap-east-1 | 0.748 |  |
| ap-east-2 | 0.671 |  |
| ap-northeast-1 | 0.553 |  |
| ap-northeast-2 | 0.641 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.896 |  |
| ap-south-2 | 0.994 |  |
| ap-southeast-1 | 0.864 |  |
| ap-southeast-2 | 0.710 |  |
| ap-southeast-3 | 0.905 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.767 |  |
| ap-southeast-7 | 0.944 |  |
| ca-central-1 | 0.143 | 18 |
| ca-west-1 | 0.241 |  |
| eu-central-1 | 0.466 |  |
| eu-central-2 | 0.478 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.497 |  |
| eu-south-2 | 0.494 |  |
| eu-west-1 | 0.376 |  |
| eu-west-2 | 0.414 |  |
| eu-west-3 | 0.442 |  |
| il-central-1 | 0.615 |  |
| me-central-1 | 0.837 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.575 |  |
| us-east-1 | 0.119 | 5117 |
| us-east-2 | 0.113 | 1686 |
| us-gov-east-1 | 0.090 | 1926 |
| us-gov-west-1 | 0.225 | 235 |
| us-west-1 | 0.170 | 4136 |
| us-west-2 | 0.225 | 192 |

