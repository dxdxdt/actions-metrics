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
Updated: 2026-04-02T18:45:11.721568+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.915 |  |
| ap-east-1 | 0.784 |  |
| ap-east-2 | 0.730 |  |
| ap-northeast-1 | 0.606 |  |
| ap-northeast-2 | 0.698 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.837 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.777 |  |
| ap-southeast-3 | 0.906 |  |
| ap-southeast-4 | 0.813 |  |
| ap-southeast-5 | 0.884 |  |
| ap-southeast-6 | 0.806 |  |
| ap-southeast-7 | 0.962 |  |
| ca-central-1 | 0.146 | 16 |
| ca-west-1 | 0.269 |  |
| eu-central-1 | 0.424 |  |
| eu-central-2 | 0.440 |  |
| eu-north-1 | 0.483 |  |
| eu-south-1 | 0.448 |  |
| eu-south-2 | 0.463 |  |
| eu-west-1 | 0.345 |  |
| eu-west-2 | 0.378 |  |
| eu-west-3 | 0.405 |  |
| il-central-1 | 0.609 |  |
| me-central-1 | 0.800 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.256 |  |
| sa-east-1 | 0.525 |  |
| us-east-1 | 0.090 | 4421 |
| us-east-2 | 0.117 | 1474 |
| us-gov-east-1 | 0.120 | 1621 |
| us-gov-west-1 | 0.294 | 191 |
| us-west-1 | 0.241 | 3337 |
| us-west-2 | 0.289 | 153 |

