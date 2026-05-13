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
Updated: 2026-05-13T14:21:55.295093+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.936 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.707 |  |
| ap-northeast-1 | 0.590 |  |
| ap-northeast-2 | 0.699 |  |
| ap-northeast-3 | 0.613 |  |
| ap-south-1 | 0.864 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.842 |  |
| ap-southeast-2 | 0.739 |  |
| ap-southeast-3 | 0.887 |  |
| ap-southeast-4 | 0.763 |  |
| ap-southeast-5 | 0.857 |  |
| ap-southeast-6 | 0.791 |  |
| ap-southeast-7 | 0.943 |  |
| ca-central-1 | 0.177 | 16 |
| ca-west-1 | 0.208 |  |
| eu-central-1 | 0.462 |  |
| eu-central-2 | 0.472 |  |
| eu-north-1 | 0.510 |  |
| eu-south-1 | 0.478 |  |
| eu-south-2 | 0.485 |  |
| eu-west-1 | 0.377 |  |
| eu-west-2 | 0.406 |  |
| eu-west-3 | 0.433 |  |
| il-central-1 | 0.613 |  |
| me-central-1 | 0.835 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.122 | 4632 |
| us-east-2 | 0.133 | 1591 |
| us-gov-east-1 | 0.149 | 1687 |
| us-gov-west-1 | 0.239 | 195 |
| us-west-1 | 0.184 | 3559 |
| us-west-2 | 0.238 | 158 |

