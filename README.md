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
Updated: 2026-06-20T22:59:58.315800+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.857 |  |
| ap-east-1 | 0.827 |  |
| ap-east-2 | 0.768 |  |
| ap-northeast-1 | 0.653 |  |
| ap-northeast-2 | 0.754 |  |
| ap-northeast-3 | 0.677 |  |
| ap-south-1 | 0.812 |  |
| ap-south-2 | 0.874 |  |
| ap-southeast-1 | 0.904 |  |
| ap-southeast-2 | 0.799 |  |
| ap-southeast-3 | 0.960 |  |
| ap-southeast-4 | 0.845 |  |
| ap-southeast-5 | 0.923 |  |
| ap-southeast-6 | 0.841 |  |
| ap-southeast-7 | 1.007 |  |
| ca-central-1 | 0.107 | 16 |
| ca-west-1 | 0.297 |  |
| eu-central-1 | 0.378 |  |
| eu-central-2 | 0.416 |  |
| eu-north-1 | 0.432 |  |
| eu-south-1 | 0.423 |  |
| eu-south-2 | 0.412 |  |
| eu-west-1 | 0.304 |  |
| eu-west-2 | 0.340 |  |
| eu-west-3 | 0.358 |  |
| il-central-1 | 0.542 |  |
| me-central-1 | 0.758 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.480 |  |
| us-east-1 | 0.057 | 4779 |
| us-east-2 | 0.106 | 1636 |
| us-gov-east-1 | 0.101 | 1715 |
| us-gov-west-1 | 0.321 | 198 |
| us-west-1 | 0.271 | 3686 |
| us-west-2 | 0.322 | 163 |

