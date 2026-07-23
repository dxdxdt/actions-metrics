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
Updated: 2026-07-23T20:53:49.489084+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.004 |  |
| ap-east-1 | 0.686 |  |
| ap-east-2 | 0.631 |  |
| ap-northeast-1 | 0.513 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.538 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.954 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.821 |  |
| ap-southeast-4 | 0.704 |  |
| ap-southeast-5 | 0.782 |  |
| ap-southeast-6 | 0.689 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.208 | 16 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.530 |  |
| eu-central-2 | 0.544 |  |
| eu-north-1 | 0.572 |  |
| eu-south-1 | 0.543 |  |
| eu-south-2 | 0.560 |  |
| eu-west-1 | 0.445 |  |
| eu-west-2 | 0.481 |  |
| eu-west-3 | 0.511 |  |
| il-central-1 | 0.684 |  |
| me-central-1 | 0.889 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.177 | 4901 |
| us-east-2 | 0.139 | 1660 |
| us-gov-east-1 | 0.138 | 1777 |
| us-gov-west-1 | 0.179 | 206 |
| us-west-1 | 0.107 | 3824 |
| us-west-2 | 0.177 | 168 |

