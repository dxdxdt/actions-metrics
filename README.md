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
Updated: 2026-06-25T14:07:56.246530+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.020 |  |
| ap-east-1 | 0.667 |  |
| ap-east-2 | 0.606 |  |
| ap-northeast-1 | 0.489 |  |
| ap-northeast-2 | 0.599 |  |
| ap-northeast-3 | 0.516 |  |
| ap-south-1 | 0.921 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.641 |  |
| ap-southeast-3 | 0.798 |  |
| ap-southeast-4 | 0.682 |  |
| ap-southeast-5 | 0.761 |  |
| ap-southeast-6 | 0.669 |  |
| ap-southeast-7 | 0.843 |  |
| ca-central-1 | 0.252 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.532 |  |
| eu-central-2 | 0.569 |  |
| eu-north-1 | 0.578 |  |
| eu-south-1 | 0.582 |  |
| eu-south-2 | 0.566 |  |
| eu-west-1 | 0.456 |  |
| eu-west-2 | 0.486 |  |
| eu-west-3 | 0.518 |  |
| il-central-1 | 0.692 |  |
| me-central-1 | 0.938 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.654 |  |
| us-east-1 | 0.208 | 4787 |
| us-east-2 | 0.175 | 1640 |
| us-gov-east-1 | 0.181 | 1720 |
| us-gov-west-1 | 0.162 | 199 |
| us-west-1 | 0.103 | 3704 |
| us-west-2 | 0.160 | 163 |

