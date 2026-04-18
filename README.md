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
Updated: 2026-04-18T23:27:59.834376+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.980 |  |
| ap-east-1 | 0.714 |  |
| ap-east-2 | 0.649 |  |
| ap-northeast-1 | 0.534 |  |
| ap-northeast-2 | 0.640 |  |
| ap-northeast-3 | 0.561 |  |
| ap-south-1 | 0.914 |  |
| ap-south-2 | 0.949 |  |
| ap-southeast-1 | 0.794 |  |
| ap-southeast-2 | 0.698 |  |
| ap-southeast-3 | 0.854 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.816 |  |
| ap-southeast-6 | 0.782 |  |
| ap-southeast-7 | 0.888 |  |
| ca-central-1 | 0.185 | 16 |
| ca-west-1 | 0.271 |  |
| eu-central-1 | 0.480 |  |
| eu-central-2 | 0.505 |  |
| eu-north-1 | 0.541 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.519 |  |
| eu-west-1 | 0.399 |  |
| eu-west-2 | 0.449 |  |
| eu-west-3 | 0.464 |  |
| il-central-1 | 0.653 |  |
| me-central-1 | 0.853 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.600 |  |
| us-east-1 | 0.152 | 4524 |
| us-east-2 | 0.141 | 1512 |
| us-gov-east-1 | 0.124 | 1656 |
| us-gov-west-1 | 0.215 | 194 |
| us-west-1 | 0.157 | 3437 |
| us-west-2 | 0.219 | 156 |

