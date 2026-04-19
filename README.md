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
Updated: 2026-04-19T14:36:50.871652+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.050 |  |
| ap-east-1 | 0.667 |  |
| ap-east-2 | 0.596 |  |
| ap-northeast-1 | 0.486 |  |
| ap-northeast-2 | 0.582 |  |
| ap-northeast-3 | 0.512 |  |
| ap-south-1 | 0.934 |  |
| ap-south-2 | 0.951 |  |
| ap-southeast-1 | 0.732 |  |
| ap-southeast-2 | 0.631 |  |
| ap-southeast-3 | 0.790 |  |
| ap-southeast-4 | 0.670 |  |
| ap-southeast-5 | 0.752 |  |
| ap-southeast-6 | 0.715 |  |
| ap-southeast-7 | 0.835 |  |
| ca-central-1 | 0.255 | 16 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.545 |  |
| eu-central-2 | 0.556 |  |
| eu-north-1 | 0.603 |  |
| eu-south-1 | 0.579 |  |
| eu-south-2 | 0.595 |  |
| eu-west-1 | 0.463 |  |
| eu-west-2 | 0.512 |  |
| eu-west-3 | 0.538 |  |
| il-central-1 | 0.734 |  |
| me-central-1 | 0.931 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.663 |  |
| us-east-1 | 0.207 | 4525 |
| us-east-2 | 0.197 | 1515 |
| us-gov-east-1 | 0.177 | 1656 |
| us-gov-west-1 | 0.150 | 194 |
| us-west-1 | 0.094 | 3443 |
| us-west-2 | 0.149 | 156 |

