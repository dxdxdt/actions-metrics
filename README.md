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
Updated: 2026-04-27T08:09:16.331158+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.022 |  |
| ap-east-1 | 0.690 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.607 |  |
| ap-northeast-2 | 0.605 |  |
| ap-northeast-3 | 0.545 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.759 |  |
| ap-southeast-2 | 0.674 |  |
| ap-southeast-3 | 0.834 |  |
| ap-southeast-4 | 0.704 |  |
| ap-southeast-5 | 0.797 |  |
| ap-southeast-6 | 0.737 |  |
| ap-southeast-7 | 0.872 |  |
| ca-central-1 | 0.233 | 16 |
| ca-west-1 | 0.214 |  |
| eu-central-1 | 0.532 |  |
| eu-central-2 | 0.552 |  |
| eu-north-1 | 0.575 |  |
| eu-south-1 | 0.556 |  |
| eu-south-2 | 0.545 |  |
| eu-west-1 | 0.443 |  |
| eu-west-2 | 0.471 |  |
| eu-west-3 | 0.500 |  |
| il-central-1 | 0.684 |  |
| me-central-1 | 0.914 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.629 |  |
| us-east-1 | 0.184 | 4571 |
| us-east-2 | 0.171 | 1537 |
| us-gov-east-1 | 0.179 | 1665 |
| us-gov-west-1 | 0.191 | 194 |
| us-west-1 | 0.137 | 3489 |
| us-west-2 | 0.184 | 157 |

