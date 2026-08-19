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
Updated: 2026-08-19T14:25:05.285566+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.044 |  |
| ap-east-1 | 0.645 |  |
| ap-east-2 | 0.586 |  |
| ap-northeast-1 | 0.467 |  |
| ap-northeast-2 | 0.577 |  |
| ap-northeast-3 | 0.492 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.906 |  |
| ap-southeast-1 | 0.721 |  |
| ap-southeast-2 | 0.605 |  |
| ap-southeast-3 | 0.778 |  |
| ap-southeast-4 | 0.647 |  |
| ap-southeast-5 | 0.742 |  |
| ap-southeast-6 | 0.639 |  |
| ap-southeast-7 | 0.828 |  |
| ca-central-1 | 0.270 | 18 |
| ca-west-1 | 0.271 |  |
| eu-central-1 | 0.562 |  |
| eu-central-2 | 0.586 |  |
| eu-north-1 | 0.604 |  |
| eu-south-1 | 0.591 |  |
| eu-south-2 | 0.606 |  |
| eu-west-1 | 0.490 |  |
| eu-west-2 | 0.524 |  |
| eu-west-3 | 0.543 |  |
| il-central-1 | 0.716 |  |
| me-central-1 | 0.930 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.673 |  |
| us-east-1 | 0.229 | 5021 |
| us-east-2 | 0.239 | 1680 |
| us-gov-east-1 | 0.208 | 1854 |
| us-gov-west-1 | 0.156 | 224 |
| us-west-1 | 0.074 | 3997 |
| us-west-2 | 0.155 | 182 |

