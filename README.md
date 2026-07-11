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
Updated: 2026-07-11T22:39:56.036389+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.948 |  |
| ap-east-1 | 0.752 |  |
| ap-east-2 | 0.693 |  |
| ap-northeast-1 | 0.576 |  |
| ap-northeast-2 | 0.678 |  |
| ap-northeast-3 | 0.600 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.890 |  |
| ap-southeast-1 | 0.828 |  |
| ap-southeast-2 | 0.706 |  |
| ap-southeast-3 | 0.883 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.845 |  |
| ap-southeast-6 | 0.740 |  |
| ap-southeast-7 | 0.931 |  |
| ca-central-1 | 0.154 | 16 |
| ca-west-1 | 0.242 |  |
| eu-central-1 | 0.458 |  |
| eu-central-2 | 0.480 |  |
| eu-north-1 | 0.511 |  |
| eu-south-1 | 0.498 |  |
| eu-south-2 | 0.500 |  |
| eu-west-1 | 0.391 |  |
| eu-west-2 | 0.421 |  |
| eu-west-3 | 0.443 |  |
| il-central-1 | 0.619 |  |
| me-central-1 | 0.828 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.571 |  |
| us-east-1 | 0.116 | 4851 |
| us-east-2 | 0.129 | 1656 |
| us-gov-east-1 | 0.111 | 1739 |
| us-gov-west-1 | 0.236 | 202 |
| us-west-1 | 0.182 | 3769 |
| us-west-2 | 0.239 | 165 |

