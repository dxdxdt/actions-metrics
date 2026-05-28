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
Updated: 2026-05-28T02:27:30.806184+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.727 |  |
| ap-east-2 | 0.651 |  |
| ap-northeast-1 | 0.534 |  |
| ap-northeast-2 | 0.636 |  |
| ap-northeast-3 | 0.567 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.940 |  |
| ap-southeast-1 | 0.787 |  |
| ap-southeast-2 | 0.693 |  |
| ap-southeast-3 | 0.837 |  |
| ap-southeast-4 | 0.724 |  |
| ap-southeast-5 | 0.804 |  |
| ap-southeast-6 | 0.710 |  |
| ap-southeast-7 | 0.889 |  |
| ca-central-1 | 0.186 | 16 |
| ca-west-1 | 0.381 |  |
| eu-central-1 | 0.500 |  |
| eu-central-2 | 0.520 |  |
| eu-north-1 | 0.544 |  |
| eu-south-1 | 0.531 |  |
| eu-south-2 | 0.545 |  |
| eu-west-1 | 0.433 |  |
| eu-west-2 | 0.476 |  |
| eu-west-3 | 0.487 |  |
| il-central-1 | 0.667 |  |
| me-central-1 | 0.872 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.194 |  |
| sa-east-1 | 0.621 |  |
| us-east-1 | 0.149 | 4692 |
| us-east-2 | 0.115 | 1613 |
| us-gov-east-1 | 0.123 | 1706 |
| us-gov-west-1 | 0.198 | 195 |
| us-west-1 | 0.145 | 3612 |
| us-west-2 | 0.202 | 161 |

