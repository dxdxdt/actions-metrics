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
Updated: 2026-06-19T17:51:24.486088+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.975 |  |
| ap-east-1 | 0.699 |  |
| ap-east-2 | 0.641 |  |
| ap-northeast-1 | 0.520 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.547 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.906 |  |
| ap-southeast-1 | 0.772 |  |
| ap-southeast-2 | 0.678 |  |
| ap-southeast-3 | 0.828 |  |
| ap-southeast-4 | 0.720 |  |
| ap-southeast-5 | 0.797 |  |
| ap-southeast-6 | 0.703 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.207 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.497 |  |
| eu-central-2 | 0.534 |  |
| eu-north-1 | 0.538 |  |
| eu-south-1 | 0.534 |  |
| eu-south-2 | 0.531 |  |
| eu-west-1 | 0.415 |  |
| eu-west-2 | 0.449 |  |
| eu-west-3 | 0.475 |  |
| il-central-1 | 0.649 |  |
| me-central-1 | 0.906 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.196 |  |
| sa-east-1 | 0.615 |  |
| us-east-1 | 0.166 | 4773 |
| us-east-2 | 0.145 | 1635 |
| us-gov-east-1 | 0.149 | 1714 |
| us-gov-west-1 | 0.193 | 198 |
| us-west-1 | 0.135 | 3681 |
| us-west-2 | 0.194 | 163 |

