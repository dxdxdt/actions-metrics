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
Updated: 2026-08-19T10:20:46.006860+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.979 |  |
| ap-east-1 | 0.694 |  |
| ap-east-2 | 0.627 |  |
| ap-northeast-1 | 0.515 |  |
| ap-northeast-2 | 0.621 |  |
| ap-northeast-3 | 0.538 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.944 |  |
| ap-southeast-1 | 0.780 |  |
| ap-southeast-2 | 0.670 |  |
| ap-southeast-3 | 0.828 |  |
| ap-southeast-4 | 0.715 |  |
| ap-southeast-5 | 0.798 |  |
| ap-southeast-6 | 0.702 |  |
| ap-southeast-7 | 0.878 |  |
| ca-central-1 | 0.207 | 18 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.483 |  |
| eu-central-2 | 0.529 |  |
| eu-north-1 | 0.534 |  |
| eu-south-1 | 0.525 |  |
| eu-south-2 | 0.534 |  |
| eu-west-1 | 0.412 |  |
| eu-west-2 | 0.461 |  |
| eu-west-3 | 0.472 |  |
| il-central-1 | 0.651 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.194 |  |
| sa-east-1 | 0.596 |  |
| us-east-1 | 0.151 | 5021 |
| us-east-2 | 0.175 | 1680 |
| us-gov-east-1 | 0.168 | 1853 |
| us-gov-west-1 | 0.211 | 224 |
| us-west-1 | 0.143 | 3994 |
| us-west-2 | 0.214 | 182 |

