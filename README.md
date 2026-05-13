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
Updated: 2026-05-13T22:59:20.161904+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.929 |  |
| ap-east-1 | 0.782 |  |
| ap-east-2 | 0.714 |  |
| ap-northeast-1 | 0.607 |  |
| ap-northeast-2 | 0.705 |  |
| ap-northeast-3 | 0.627 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.852 |  |
| ap-southeast-2 | 0.769 |  |
| ap-southeast-3 | 0.897 |  |
| ap-southeast-4 | 0.816 |  |
| ap-southeast-5 | 0.876 |  |
| ap-southeast-6 | 0.852 |  |
| ap-southeast-7 | 0.965 |  |
| ca-central-1 | 0.113 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.435 |  |
| eu-central-2 | 0.449 |  |
| eu-north-1 | 0.471 |  |
| eu-south-1 | 0.459 |  |
| eu-south-2 | 0.469 |  |
| eu-west-1 | 0.361 |  |
| eu-west-2 | 0.385 |  |
| eu-west-3 | 0.416 |  |
| il-central-1 | 0.585 |  |
| me-central-1 | 0.816 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.538 |  |
| us-east-1 | 0.082 | 4633 |
| us-east-2 | 0.077 | 1591 |
| us-gov-east-1 | 0.078 | 1689 |
| us-gov-west-1 | 0.278 | 195 |
| us-west-1 | 0.216 | 3560 |
| us-west-2 | 0.271 | 158 |

